@testset "PMLoadSymbol" begin
    data = loadPMedianProblem(:pmedcap01)
    @test data.name == "pmedcap01"
    @test data.medians == 5
    @test data.capacity == 120
    @test data.demands[41] == 7
    @test data.costs[12, 34] == 87
    @test nc(data) == 50
    @test data.ub == 713
    @test_nowarn println(data)
end

@testset "PMErrorSymbol" begin
    data = loadPMedianProblem(:notaninstance)
    @test data === nothing
end

@testset "PMLoadString" begin
    data = loadPMedianProblem(joinpath(pkgdir(FacilityLocationProblems), "test/data/pmedcap01.txt"))
    @test data.name == "pmedcap01"
    @test data.medians == 5
    @test data.capacity == 120
    @test data.demands[41] == 7
    @test data.costs[12, 34] == 87
    @test nc(data) == 50
    @test data.ub == 713
    @test_nowarn println(data)
end

@testset "PMErrorString" begin
    data = loadPMedianProblem("notaninstance")
    @test data === nothing
end

@testset "InstanceList" begin
    list = getPMedianInstances()
    @test list[10] == :pmedcap10
    @test length(list) == 20
end
