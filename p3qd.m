function p3qd
    text = reshape(textread('vocab.txt', '%s'),500,1);%read the text
    unigram = reshape(textread('unigram.txt', '%f'),500,1);%read the unigram vals
    
    unigramC = sum(unigram, 1, 'double');
    
    bigram = txt2mat('bigram.txt'); %read the bigram into a matrix
        
    sIndex = 0.0;
    sCount = 0.0;
    theIndex = 0.0;
    theCount = 0.0;
    fourteenIndex = 0.0;
    fourteenCount = 0.0;
    officialsIndex = 0.0;
    officialsCount = 0.0;
    soldIndex = 0.0;
    soldCount = 0.0;
    fireIndex = 0.0;
    fireCount = 0.0;
    insuranceIndex = 0.0;
    insuranceCount = 0.0;
    
    for i=1:size(text, 1)
        if(strcmp(text(i,1), '<s>') == 1)
            sIndex = i;
            sCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'THE') == 1)
            theIndex = i;
            theCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'FOURTEEN') == 1)
            fourteenIndex = i;
            fourteenCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'OFFICIALS') == 1)
            officialsIndex = i;
            officialsCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'SOLD') == 1)
            soldIndex = i;
            soldCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'FIRE') == 1)
            fireIndex = i;
            fireCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'INSURANCE') == 1)
            insuranceIndex = i;
            insuranceCount = unigram(i,1);
        end
    end
    
    %calculate the value for Lu
    Lu = log((theCount * fourteenCount * officialsCount * soldCount * fireCount * insuranceCount)/unigramC);
    
    fprintf('L_u = %g\n\n', Lu); %print out the value for Lu
    
    pTheS = 0.0;
    pfourteenThe = 0.0;
    pofficialsfourteen = 0.0;
    psoldofficials = 0.0;
    pfiresold = 0.0;
    pinsurancefire = 0.0;
    
    for i = 1:size(bigram, 1)
        if(bigram(i,1) == sIndex && bigram(i,2) == theIndex) %the given <s>
            pTheS = bigram(i,3)/sCount;
        end
        if(bigram(i,1) == theIndex && bigram(i,2) == fourteenIndex) %fourteen given the
            pfourteenThe = bigram(i,3)/theCount;
        end
        if(bigram(i,1) == fourteenIndex && bigram(i,2) == officialsIndex) %officials given fourteen
            pofficialsfourteen = bigram(i,3)/fourteenCount;
        end
        if(bigram(i,1) == officialsIndex && bigram(i,2) == soldIndex) %sold given officials
            psoldofficials = bigram(i,3)/officialsCount;
        end
        if(bigram(i,1) == soldIndex && bigram(i,2) == fireIndex) %fire given sold
            pfiresold = bigram(i,3)/soldCount;
        end
        if(bigram(i,1) == fireIndex && bigram(i,2) == insuranceIndex) %insurance given fire
            pinsurancefire = bigram(i,3)/fireCount;
        end
    end
    
    Lb = log(pTheS*pfourteenThe*pofficialsfourteen*psoldofficials*pfiresold*pinsurancefire);
    
    fprintf('L_b = %g\n\n', Lb); %print out the value for Lb    
