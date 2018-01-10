function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


	[JJ, grad2] = costFunction(theta, X, y);

	theta_zeroed_first = [0; theta(2:length(theta));];

	%JJ = JJ + lambda / (2 * m) * sum( theta_zeroed_first .^ 2 );
	%grad2 = grad2 .+ (lambda / m) * theta_zeroed_first;
	%J = JJ;
	%grad = grad2;

	h_of_x = sigmoid(X * theta);

	J = (1 / m) * sum( -1 * y' * log(h_of_x) - (1-y') * log(1-h_of_x) ) + lambda / (2 * m) * sum( theta_zeroed_first .^ 2 );
	grad = 1 / m * (X' * (h_of_x - y)) + (lambda/m)*theta_zeroed_first;


% =============================================================

end
