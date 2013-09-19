function f = Disconnect(TL)
	A = calllib('usbdll','newp_usb_uninit_system');
	disp('All USB Device from Newport is closed.');
	f = 1;
end
