json.user_name @message.shop.name
json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.content @message.content
json.id @message.id
