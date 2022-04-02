## usersテーブル

| Column	            | Type	  | Options     |
| ------------------- | ------- | ----------- |
| nickname	          | string	| null: false |
| email	              | string	| null: false |
| encrypted_password	| string	| null: false |
| family_name	        | string	| null: false |
| first_name	        | string	| null: false |
| family_name_kana	  | string	| null: false |
| first_name_kana	    | string	| null: false |
| birth_day	          | date	  | null: false |

### Association
- has_many :items dependent: :destroy
- belongs_to :buyers dependent: :destroy
- belongs_to :cards dependent: :destroy



## itemsテーブル

| Column	       | Type	   | Options                        |
| -------------- | ------- | ------------------------------ |
| name	         | string	 | null: false                    |
| price	         | string	 | null: false                    |
| description	   | string	 | null: false                    |
| item_condition | string	 | null: false                    |
| shipping_cost	 | string	 | null: false                    |
| shipping_days	 | string	 | null: false                    |
| prefecture_id	 | string	 | null: false                    |
| category_id	   | integer | null: false, foreign_key: true |
| brand_id	     | integer | null: false, foreign_key: true |
| user_id	       | integer | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_many :item_images dependent: :destroy
- belongs_to_active_hash :category_id
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :prefecture_id
- belongs_to_active_hash :shipping_days
- belongs_to_active_hash :brand_id




## buyersテーブル

| Column	         | Type	   | Options                        |
| ---------------- | ------- | -----------------------------  |
| family_name	     | string	 | null: false                    |
| first_name	     | string	 | null: false                    |
| family_name_kana | string	 | null: false                    |
| first_name_kane	 | string	 | null: false                    |
| post_code	       | string	 | null: false                    |
| prefecture	     | string	 | null: false                    |
| city	           | string	 | null: false                    |
| address	         | string	 | null: false                    |
| building_name	   | string	 |                                |
| phone_number	   | string	 |                                |
| user_id	         | integer | null: false, foreign_key: true |

### Association
- belongs_to :users



## cardsテーブル

| Column	    | Type	  | Options                        |
| ----------- | ------- | ------------------------------ |
| user_id	    | integer	| null: false, foreign_key: true |
| customer_id	| string	| null: false                    |
| card_id	    | string	| null: false                    |

### Association
- belongs_to :users



## item_imagesテーブル
| Column | Type	  | Options     |
| -------| ------ | ----------- |
| url    | string | null: false |

- belongs_to :items












