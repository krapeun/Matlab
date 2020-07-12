% 2x2 Matrix Simple Calculator 행렬 사칙 연산기

function val = matrix_calculator()
    mode = input('1. Adder\n2. Subtractor\n3. Multiplier\n4. Divider\nSelect Mode : ');
    
    switch(mode)
        case 1
            disp('Type two input values');
            A = input('First input : ');
            B = input('Second input : ');
            val = Add_mat(A,B);
        case 2
            disp('Type two input values');
            A = input('First input : ');
            B = input('Second input : ');
            val = Sub_mat(A,B);
        case 3
            disp('Type two input values');
            A = input('First input : ');
            B = input('Second input : ');
            val = Mul_mat(A,B);
        case 4
            disp('Type two input values');
            A = input('First input : ');
            B = input('Second input : ');
            val = Div_mat(A,B);
        otherwise
            disp('Invalid Mode Error');
            return;
    end
end

function val = Add_mat(A,B) % Adder
    [row,col] = size(A);
    val = zeros(row,col); % 초기화
    if(size(A)~=size(B)) % A와 B의 크기가 다르면 error
        disp('Matrices size error! Check your matirces');
        return;
    else
        for k=1:row
            for kk=1:col
                val(k,kk) = A(k,kk) + B(k,kk);
            end
        end
    end
end

function val = Sub_mat(A,B) % Subtractor
    [row,col] = size(A);
    val = zeros(row,col); % 초기화
    if(size(A) ~= size(B)) % A와 B의 크기가 다르면 error
        disp('Matrices size error! Check your matirces');
        return;
    else
        for k=1:row
            for kk=1:col
                val(k,kk) = A(k,kk) - B(k,kk);
            end
        end
    end
end

function val = Mul_mat(A,B) % Multiplier
    [rowOfA,columeOfA]=size(A);
    [rowOfB,columeOfB]=size(B);
    val = zeros(rowOfA,columeOfB); % 초기화
    if(columeOfA ~= rowOfB) % A의 열과 B의 행의 크기가 다르면 error
        disp('Matrices size error! Check your matirces');
        return;
    else
        for k=1:rowOfA
            for kk=1:columeOfB
                for temp=1:columeOfA
                    val(k,kk) = val(k,kk) + A(k,temp) * B(temp,kk);
                end
            end
        end
    end
end

function val = Div_mat(A,B) % Divider
    [rowOfA,columeOfA]=size(A);
    [rowOfB,columeOfB]=size(B);
    val = zeros(rowOfA,columeOfB); % 초기화
    if(columeOfA ~= rowOfB) % A의 열과 B의 행의 크기가 다르면 error
        disp('Matrices size error! Check your matirces');
        %return;
    elseif(det(B)==0) % B가 invertible하지 않으면 error
        disp('Matrices must be invertible!');
        %return;
    else
        C = inv(B);
        [rowOfC,columeOfC]=size(C);
        for k=1:rowOfA
            for kk=1:columeOfC
                for temp=1:columeOfA
                    val(k,kk) = val(k,kk) + A(k,temp) * C(temp,kk);
                end
            end
        end
    end
end
