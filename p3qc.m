function p3qc
    text = reshape(textread('vocab.txt', '%s'),500,1);%read the text
    unigram = reshape(textread('unigram.txt', '%f'),500,1);%read the unigram vals
    
    unigramC = sum(unigram, 1, 'double');
    
    bigram = txt2mat('bigram.txt'); %read the bigram into a matrix
        
    sIndex = 0.0;
    sCount = 0.0;
    theIndex = 0.0;
    theCount = 0.0;
    marketIndex = 0.0;
    marketCount = 0.0;
    fellIndex = 0.0;
    fellCount = 0.0;
    byIndex = 0.0;
    byCount = 0.0;
    oneIndex = 0.0;
    oneCount = 0.0;
    hundredIndex = 0.0;
    hundredCount = 0.0;
    pointsIndex = 0.0;
    pointsCount = 0.0;
    lastIndex = 0.0;
    lastCount = 0.0;
    weekIndex = 0.0;
    weekCount = 0.0;
    
    for i=1:size(text, 1)
        if(strcmp(text(i,1), '<s>') == 1)
            sIndex = i;
            sCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'THE') == 1)
            theIndex = i;
            theCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'MARKET') == 1)
            marketIndex = i;
            marketCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'FELL') == 1)
            fellIndex = i;
            fellCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'BY') == 1)
            byIndex = i;
            byCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'ONE') == 1)
            oneIndex = i;
            oneCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'HUNDRED') == 1)
            hundredIndex = i;
            hundredCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'POINTS') == 1)
            pointsIndex = i;
            pointsCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'LAST') == 1)
            lastIndex = i;
            lastCount = unigram(i,1);
        end
        if(strcmp(text(i,1), 'WEEK') == 1)
            weekIndex = i;
            weekCount = unigram(i,1);
        end
    end
    
    %calculate the value for Lu
    Lu = log((theCount * marketCount * fellCount * byCount * oneCount * hundredCount * pointsCount * lastCount * weekCount)/unigramC);
    
    fprintf('L_u = %g\n\n', Lu); %print out the value for Lu
    
    pTheS = 0.0;
    pMarketThe = 0.0;
    pFellMarket = 0.0;
    pByFell = 0.0;
    pOneBy = 0.0;
    pHundredOne = 0.0;
    pPointsHundred = 0.0;
    pLastPoints = 0.0;
    pWeekLast = 0.0;
    
    for i = 1:size(bigram, 1)
        if(bigram(i,1) == sIndex && bigram(i,2) == theIndex) %the given <s>
            pTheS = bigram(i,3)/sCount;
        end
        if(bigram(i,1) == theIndex && bigram(i,2) == marketIndex) %market given the
            pMarketThe = bigram(i,3)/theCount;
        end
        if(bigram(i,1) == marketIndex && bigram(i,2) == fellIndex) %fell given market
            pFellMarket = bigram(i,3)/marketCount;
        end
        if(bigram(i,1) == fellIndex && bigram(i,2) == byIndex) %by given fell
            pByFell = bigram(i,3)/fellCount;
        end
        if(bigram(i,1) == byIndex && bigram(i,2) == oneIndex) %one given by
            pOneBy = bigram(i,3)/byCount;
        end
        if(bigram(i,1) == oneIndex && bigram(i,2) == hundredIndex) %hundred given one
            pHundredOne = bigram(i,3)/oneCount;
        end
        if(bigram(i,1) == hundredIndex && bigram(i,2) == pointsIndex) %points given hundred
            pPointsHundred = bigram(i,3)/hundredCount;
        end
        if(bigram(i,1) == pointsIndex && bigram(i,2) == lastIndex) %last given points
            pLastPoints = bigram(i,3)/pointsCount;
        end
        if(bigram(i,1) == lastIndex && bigram(i,2) == weekIndex) %week given last
            pWeekLast = bigram(i,3)/lastCount;
        end
    end
    
    Lb = log(pTheS*pMarketThe*pFellMarket*pByFell*pOneBy*pHundredOne*pPointsHundred*pLastPoints*pWeekLast);
    
    fprintf('L_b = %g\n\n', Lb); %print out the value for Lb
    
    