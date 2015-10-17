opt_val = load('kernel/liver_optimal_objective');

val = load('kernel/liver_objective');
ind =[7 52 137 221 469];
v = val(ind);
p = v./opt_val;
ratio(:,4)=[p;1];