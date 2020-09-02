module UsersHelper
  def generate_relation_btn(user,type)
    counter_relation_category = have_relation(@mutual_relationships.find{|arr| arr[0] == user.id })
    mutual_relation = mutual_relation_array([counter_relation_category,user.relation_category],type)
    generate_content(mutual_relation)
    case mutual_relation
    when [0,1]
      content_tag(:span) do
        'フォローされています'
      end
    when [1,0]
      content_tag(:span) do
        'フォローしています'
      end
    when [1,1]
      content_tag(:span) do
        '相互フォロー'
      end
    when [1,3]
      content_tag(:span) do
        '家族申請されています'
      end
    when [3,1]
      content_tag(:span) do
        '家族申請しています'
      end
    when [3,3]
      content_tag(:span) do
        '家族'
      end
    else
      content_tag(:span) do
        'error'
      end
    end

  end

  private

  def have_relation(user)
    user == nil ? 0 : user[1]
  end

  def mutual_relation_array(array,type)
    type == :following ? [array[1],array[0]] : array
  end

  def generate_content(array)
  end

end
