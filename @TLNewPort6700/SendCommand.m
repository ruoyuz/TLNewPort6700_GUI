function f = SendCommand(TL,Command)
    TL.tSendCommand(Command);
    TL.tGetStat();
    f = 1;
end