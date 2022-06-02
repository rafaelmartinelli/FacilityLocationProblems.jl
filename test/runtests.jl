using CFLPLib
using Test

@testset "LoadSymbol" begin
    data = loadCFLP(:cap41)
    @test data.name == "cap41"
    @test data.facilities[3].capacity == 5000
    @test data.facilities[5].fixed_cost == 7500.0
    @test data.customers[7].demand == 2370
    @test length(data.facilities) == 16
    @test length(data.customers) == 50
    @test data.lb == 1040444.375
    @test data.ub == 1040444.375
    @test_nowarn println(data)
    @test_nowarn println(data.facilities[2])
    @test_nowarn println(data.customers[6])
end

@testset "ErrorSymbol" begin
    data = loadCFLP(:notaninstance)
    @test data === nothing
end

@testset "LoadString" begin
    data = loadCFLP(joinpath(pkgdir(CFLPLib), "test/data/cap41.txt"))
    @test data.name == "cap41"
    @test data.facilities[3].capacity == 5000
    @test data.facilities[5].fixed_cost == 7500.0
    @test data.customers[7].demand == 2370
    @test length(data.facilities) == 16
    @test length(data.customers) == 50
    @test data.lb == 1040444.375
    @test data.ub ==1040444.375
    @test_nowarn println(data)
    @test_nowarn println(data.facilities[2])
    @test_nowarn println(data.customers[6])
end

@testset "ErrorString" begin
    data = loadCFLP("notaninstance")
    @test data === nothing
end
