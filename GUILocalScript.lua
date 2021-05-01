local ChooseMessageButton = script.Parent.ChooseMessageButton

local SendFrame = script.Parent.SendFrame
local MessageText = SendFrame.MessageText


local SendButton = script.Parent.SendButton


ChooseMessageButton.MouseButton1Down:Connect(function()
	SendFrame.Visible = true
	SendButton.Visible = true
	
	ChooseMessageButton.Visible = false
end)

SendButton.MouseButton1Down:Connect(function()
	if MessageText.Text == "" then
		MessageText.PlaceholderColor3 = Color3.fromRGB(255,0,0)
		MessageText.PlaceholderText = "Please write a message"
		wait(3)
		MessageText.PlaceholderColor3 = Color3.fromRGB(0,0,0)
		MessageText.PlaceholderText = "Write the message here"
	end
	game.ReplicatedStorage.SendMessageServer:FireServer(MessageText.Text)
	SendFrame.Visible = false
	SendButton.Visible = false
	ChooseMessageButton.Visible = true
end)

game.ReplicatedStorage.SendMessageClient.OnClientEvent:Connect(function()
	print("Picking up on the client")
	local Message = script.Parent.Message
	Message.Text = game.ReplicatedStorage.MessageValue.Value
	Message:TweenPosition(UDim2.new(0,0,0.5,0),"Out","Bounce",1.5,true)
	wait(10)
	Message:TweenPosition(UDim2.new(0,0,-5,0),"Out","Bounce",1.5,true)
	
end)
