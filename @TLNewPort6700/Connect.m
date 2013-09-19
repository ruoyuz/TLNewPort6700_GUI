function f = Connect(TL)
	v1 = libpointer('int32Ptr',0);
	[A B] = calllib('usbdll','newp_usb_open_devices',TL.productID,1,v1);
	if B==0
		errordlg('Failed to connect to TLNP6700.');
		f = -1;
		return;
    end
	disp(['Connected: ',num2str(B)]);
	f = 1;
end
