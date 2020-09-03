module UsersHelper
  def generate_relation_btn(user,type)
    counter_relation_category = have_relation(@mutual_relationships.find{|arr| arr[0] == user.id })
    mutual_relation = mutual_relation_array([counter_relation_category,user.relation_category],type)
    case mutual_relation
    when [nil,1],[nil,3]
      generate_content(mutual_relation, 'フォローされています', 'color_receive_follow', user)
    when [1,nil],[3,nil]
      generate_content(mutual_relation, 'フォローしています', '', user)
    when [1,1]
      generate_content(mutual_relation, '相互フォロー', '', user)
    when [1,3]
      generate_content(mutual_relation, '家族申請されています', 'color_receive_family', user)
    when [3,1]
      generate_content(mutual_relation, '家族申請しています', 'color_send_family', user)
    when [3,3]
      generate_content(mutual_relation, '家族', 'color_family', user)
    end
  end

  private

  def have_relation(user)
    user == nil ? nil : user[1]
  end

  def mutual_relation_array(array,type)
    type == :following ? [array[1],array[0]] : array
  end

  def generate_content(array, comment, style, user)
    content_tag(:div, class:'relation_box') do
      if array[0].present? && array[1].present?
        relation_view(array,comment,"fas fa-handshake #{style}",user)
      else
        relation_view(array,comment,"far fa-handshake #{style}",user)
      end
    end
  end

  def relation_view(array, comment, style, user)
    concat content_tag(:i,'', class: style)
    concat content_tag(:span, comment, class:'relation_comment')
    case array
    when [nil,1],[nil,3]
      concat link_to('フォロー', relationships_path(followed_id: user, relation_category_id: 1), method:'post', class:'button2')
    when [1,nil],[3,nil]
      concat link_to('フォロー解除', relationship_path(follower_id:current_user.id ,followed_id: user.id), method:'delete', class:'button2')
    when [1,1]
      concat link_to('フォロー解除', relationship_path(follower_id:current_user.id ,followed_id: user.id), method:'delete', class:'button2')

      concat link_to('家族申請を送信', relationship_path(follower_id:current_user.id ,followed_id: user.id, relation_category_id: 3, edit_title:'家族申請を送信'), method:'patch', class:'button2')
    when [1,3]
      concat link_to('家族申請を受諾', relationship_path(follower_id:current_user.id ,followed_id: user.id, relation_category_id: 3, edit_title:'家族申請を受諾'), method:'patch', class:'button2')

      concat link_to('家族申請を却下', relationship_path(follower_id: user.id ,followed_id: current_user.id, relation_category_id: 1, edit_title:'家族申請を却下'), method:'patch', class:'button2')
    when [3,1]
      concat link_to('家族申請を解除', relationship_path(follower_id:current_user.id ,followed_id: user.id, relation_category_id: 1, edit_title:'家族申請を解除'), method:'patch', class:'button2')
    when [3,3]
      concat link_to('家族関係を解除', relationship_path(follower_id:current_user.id ,followed_id: user.id, relation_category_id: 1, edit_title:'家族関係を解除'), method:'patch', class:'button2')
    end
  end
end
