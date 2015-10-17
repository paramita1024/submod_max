% Implementation of a (directed) cut function
% Author: Andreas Krause (krausea@gmail.com)
%
% function C = sfo_fn_cutfun(G,A)
% G: Adjacency matrix of the graph
% A: subset of vertices to measure cut *from*
%
% Example: G = [1 1 0; 1 0 1; 0 1 1]; F = sfo_fn_cutfun(G); F([1 3])

function F = cncv_mod(v,q)
fn = @(A) eval_cncv_mod(v,A ,q );
F = sfo_fn_wrapper(fn);


function C = eval_cncv_mod(v,A,q )
A = sfo_unique_fast(A);
C = (sum(v(A))).^q;
