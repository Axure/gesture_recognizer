% take a gesture and a sequence of templates and return the 
% recognized gestures
% fist=img file   pawn=img file
function [gesture, location] = recognizeGesture(fileName, fist, pawn)
gestureImg = im2bw(imresize(imread(fileName), 0.1), 0.5);
trimedGestureImg = imtrim(gestureImg);
fingerCount = countFinger(trimedGestureImg);
if fingerCount <= 2
    location = detectWhere(gestureImg, fist);
    gesture = 'fist';
else
    location = detectWhere(gestureImg, pawn);
    gesture = 'pawn';
end

end