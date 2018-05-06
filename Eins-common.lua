print("Common loaded")

--local frame = EnumerateFrames()
while frame do
    if frame:IsVisible() then
        DEFAULT_CHAT_FRAME:AddMessage(frame:GetName())
    end
    frame = EnumerateFrames(frame)
end