function p3qa 
    %fID = fopen('vocab.txt');
    %[A, count] = fscanf(fID, '%s ', [500, 1])
    text = reshape(textread('vocab.txt', '%s'),500,1);%read the text
    
    unigram = reshape(textread('unigram.txt', '%f'),500,1);%read the unigram vals
    
    unigramC = sum(unigram, 1, 'double');
    
    for i=1:size(text,1)
        if(strncmpi(text(i,1), 'D', 1) == 1)%read all that start with D
            disp(text(i,1)) %display the word
            fprintf('Unigram distribution = %g\n\n', unigram(i,1)/unigramC)
            %fprintf('%s\n', text(i,1));
        end
    end
     

