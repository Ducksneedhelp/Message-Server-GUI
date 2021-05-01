game.ReplicatedStorage.SendMessageServer.OnServerEvent:Connect(function(player, messageText)
	
	local messageValue = game.ReplicatedStorage.MessageValue
	messageValue.Value = messageText
	
	game.ReplicatedStorage.SendMessageClient:FireAllClients(player)
	print("Firing to client")
end)
