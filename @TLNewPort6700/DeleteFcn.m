function f = DeleteFcn(TL)
    TL.Disconnect;
    delete(TL);
end