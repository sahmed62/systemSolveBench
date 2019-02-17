function [A, L, U] = randInvSquare(N)
    % Set L and U to the scaled identity matrix
    U = L = eye(N) * 2;
    for row = 1:(N-1)
        % populate the non-diagonal columns of the row-th row of U
        U_col_start = row+1;
        U_col_end = N;
        U(row, U_col_start:U_col_end) = rand(1, (U_col_end-U_col_start+1));
        % populate the non-diagonal columns of the L_row-th row of L
        L_row = row+1;
        L_col_start = 1;
        L_col_end = L_row-1;
        L(L_row, L_col_start:L_col_end) = rand(1, (L_col_end-L_col_start+1));
    end
    % compute A
    A = L*U;
end
