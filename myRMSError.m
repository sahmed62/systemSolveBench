function value = myRMSError(A, B)
    value = sqrt(mean((A(:)-B(:)).^2));
end
