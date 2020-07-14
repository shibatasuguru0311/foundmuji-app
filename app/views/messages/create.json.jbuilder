json.user_name @message.shop.name
json.created_at @message.created_at.strftime('%Y.%m.%d')
json.content @message.content
json.id @message.id
