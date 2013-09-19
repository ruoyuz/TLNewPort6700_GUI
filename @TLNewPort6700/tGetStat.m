function f = tGetStat(TL)
    N = 64;
    tt=['',TL.Buffer];
	uN = uint32(N);
    v1 = libpointer('cstring',tt);
	v2 = libpointer('uint32Ptr',uN);
    C = libpointer('uint32Ptr',uN);
	[A B C] = calllib('usbdll','newp_usb_get_ascii',TL.usbAddress,v1,uN,v2);
    if numel(B)==0
        disp('No Data Recieved.')
    else
        x = N;
        for i = 1:N
            if B(i)==char(13)
                x = i-1;
                break;
            end
        end
    TL.qResponse=B(1:x);
%     disp(B(1:x));
    end
    f = 1;
end
