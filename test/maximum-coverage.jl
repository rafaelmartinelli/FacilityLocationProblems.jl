@testset "MCLoadSymbol" begin
    data = loadMaximumCoverageProblem(:pmedcap01, 10)
    @test data.name == "pmedcap01"
    @test data.medians == 5
    @test data.distance == 10
    @test data.demands[41] == 7
    @test length(data.coverage[12]) == 3
    @test data.coverage[12][3] == 35
    @test nc(data) == 50
    @test data.ub == Inf
    @test_nowarn println(data)
end

@testset "MCErrorSymbol" begin
    data = loadMaximumCoverageProblem(:notaninstance, 10)
    @test data === nothing
end

@testset "MCLoadString" begin
    data = loadMaximumCoverageProblem(joinpath(pkgdir(FacilityLocationProblems), "test/data/pmedcap01.txt"), 10)
    @test data.name == "pmedcap01"
    @test data.medians == 5
    @test data.distance == 10
    @test data.demands[41] == 7
    @test length(data.coverage[12]) == 3
    @test data.coverage[12][3] == 35
    @test nc(data) == 50
    @test data.ub == Inf
    @test_nowarn println(data)
end

@testset "MCErrorString" begin
    data = loadMaximumCoverageProblem("notaninstance", 10)
    @test data === nothing
end

@testset "InstanceList" begin
    list = getMaximumCoverageInstances()
    @test list[10] == :pmedcap10
    @test length(list) == 20
end
