function f = Query(TL,Command)
    TL.tSendCommand(Command);
    TL.tGetStat();
    disp([Command,' : ',TL.qResponse]);
    f = 1;
end