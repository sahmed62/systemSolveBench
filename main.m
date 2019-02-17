% Try matrices and problems of different sizes:
iterations = 10;
N_list = [64, 256, 1024]; 
K_list = [1, 8, 64];

% Initialize the arrays for storing results
time_mean_NULL = zeros(3, 3);
time_std_NULL = zeros(3, 3);

error_mean_NULL = zeros(3, 3);
error_std_NULL = zeros(3, 3);

time_mean_inv = zeros(3, 3);
time_std_inv = zeros(3, 3);

error_mean_inv = zeros(3, 3);
error_std_inv = zeros(3, 3);

time_mean_GE = zeros(3, 3);
time_std_GE = zeros(3, 3);

error_mean_GE = zeros(3, 3);
error_std_GE = zeros(3, 3);

time_mean_LU = zeros(3, 3);
time_std_LU = zeros(3, 3);

error_mean_LU = zeros(3, 3);
error_std_LU = zeros(3, 3);

% loop over values of N and K
for i_N = 1:3
    for i_K = 1:3
        N = N_list(i_N);
        K = K_list(i_K);
        % compute the input arguments
        A = randInvSquare(N);
        RR = rand(N, K);
        ARR = A * RR;
        args = struct;
        args.A = A;
        args.ARR = ARR;

        % Get the reference time for the bench-marking code.
        printf(" method:\tNULL\n N:\t\t%i\n K:\t\t%i\n", N, K);
        fflush(stdout);
        [timelist, errorlist] = myBenchMark( @mySolve_NULL, args, RR, iterations);
        time_mean_NULL(i_N, i_K) = mean(timelist);
        time_std_NULL(i_N, i_K) = std(timelist);

        % Get the time and error for mySolve_inv
        printf(" method:\tinv\n N:\t\t%i\n K:\t\t%i\n", N, K);
        fflush(stdout);
        [timelist, errorlist] = myBenchMark( @mySolve_inv, args, RR, iterations);
        
        time_mean_inv(i_N, i_K) = mean(timelist);
        time_std_inv(i_N, i_K) = std(timelist);
        
        error_mean_inv(i_N, i_K) = mean(errorlist);
        error_std_inv(i_N, i_K) = std(errorlist);

        % Get the time and error for mySolve_GE
        printf(" method:\tGE\n N:\t\t%i\n K:\t\t%i\n", N, K);
        fflush(stdout);
        [timelist, errorlist] = myBenchMark( @mySolve_GE, args, RR, iterations);
        
        time_mean_GE(i_N, i_K) = mean(timelist);
        time_std_GE(i_N, i_K) = std(timelist);
        
        error_mean_GE(i_N, i_K) = mean(errorlist);
        error_std_GE(i_N, i_K) = std(errorlist);

        % Get the time and error for mySolve_LU
        printf(" method:\tLU\n N:\t\t%i\n K:\t\t%i\n", N, K);
        fflush(stdout);
        [timelist, errorlist] = myBenchMark( @mySolve_LU, args, RR, iterations);
        
        time_mean_LU(i_N, i_K) = mean(timelist);
        time_std_LU(i_N, i_K) = std(timelist);
        
        error_mean_LU(i_N, i_K) = mean(errorlist);
        error_std_LU(i_N, i_K) = std(errorlist);
    end
end

% error in measuring time
time_NULL_csv = zeros(rows(time_mean_NULL), columns(time_mean_NULL)*2);
time_NULL_csv(:,1:2:end) = time_mean_NULL;
time_NULL_csv(:,2:2:end) = time_std_NULL;
csvwrite('time_overhead.csv', time_NULL_csv);

% RMS error comparisons
error_csv = zeros(rows(error_mean_inv), columns(error_mean_inv)*6);
error_csv(:,1:6:end) = error_mean_inv;
error_csv(:,2:6:end) = error_std_inv;
error_csv(:,3:6:end) = error_mean_GE;
error_csv(:,4:6:end) = error_std_GE;
error_csv(:,5:6:end) = error_mean_LU;
error_csv(:,6:6:end) = error_std_LU;
csvwrite('rmsError.csv', error_csv);

% time comparisons
time_csv = zeros(rows(time_mean_inv), columns(time_mean_inv)*6);
time_csv(:,1:6:end) = time_mean_inv;
time_csv(:,2:6:end) = time_std_inv;
time_csv(:,3:6:end) = time_mean_GE;
time_csv(:,4:6:end) = time_std_GE;
time_csv(:,5:6:end) = time_mean_LU;
time_csv(:,6:6:end) = time_std_LU;
csvwrite('time.csv', time_csv);

