require 'active_support/concern'
module BondGenerate
  extend ActiveSupport::Concern

  # インクルード先にメソッド（クラスメソッド）追加
  class_methods do
    def bond_create(user_id: user, pet_id: pet, relation_category_id: relation_category)
      Bond.create(user_id: user_id, pet_id: pet_id, relation_category_id: relation_category_id )
    end
  end
end
