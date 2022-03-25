using Test
import Nauty
import LightGraphs
const n = Nauty

N=100
g1,g2,g3 = [LightGraphs.DiGraph(N) for _ in 1:3]
for i in 1:N
    LightGraphs.add_edge!(g1,i,i==N ? 1 : i+1)
    LightGraphs.add_edge!(g2,i,i==1 ? N : i-1)
    LightGraphs.add_edge!(g3,i,i==N ? 2 : i+1)
end
@test n.baked_canonical_form(g1).canong == n.baked_canonical_form(g2).canong
@test n.baked_canonical_form(g1).canong != n.baked_canonical_form(g3).canong


