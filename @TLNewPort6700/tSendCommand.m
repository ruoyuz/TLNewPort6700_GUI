function f = tSendCommand(TL,Command)
    fCommand = [Command,char(13),char(10)];
%     fCommand = Command;
	v = libpointer('cstring',fCommand);
	uN = uint32(length(fCommand));
	A = calllib('usbdll','newp_usb_send_ascii',TL.usbAddress,v,uN);
    f = 1;
end
