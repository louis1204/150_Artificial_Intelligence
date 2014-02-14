function p3qb
    text = reshape(textread('vocab.txt', '%s'),500,1);%read the text
    unigram = reshape(textread('unigram.txt', '%f'),500,1);%read the unigram vals
    
    oneIndex = 0.0;
    oneCount = 0.0;

    for i = 1:size(text,1)
        if(strcmp(text(i, 1), 'ONE') == 1)
            oneIndex = i; %17
        end
    end
    
    oneCount = unigram(oneIndex, 1);
    
    bigram = txt2mat('bigram.txt'); %read the bigram into a matrix
    
    temp = zeros(size(bigram, 1),1);
    %read the bigram probabilities for index for 1 (w2)
    for i = 1:size(bigram,1)
        if(bigram(i,1) == oneIndex) %find the ONEs
            temp(i,1) = bigram(i,3);
        end
    end
    temp( all(~temp,2), : ) = [];  %trim out all 0 rows
    temp = sort(temp, 1, 'descend');
    
    for i=1:10  %print out the word and the probability
        for j = 1:size(bigram,1)
            if(bigram(j,1) == oneIndex && bigram(j,3) == temp(i,1))
                display(text(bigram(j,2)))
                fprintf('Bigram distribution = %g\n\n', temp(i,1)/oneCount);
            end
        end
    end
            