using FacilityLocationProblems
using Documenter

DocMeta.setdocmeta!(FacilityLocationProblems, :DocTestSetup, :(using FacilityLocationProblems); recursive=true)

makedocs(;
    modules=[FacilityLocationProblems],
    authors="Rafael Martinelli",
    repo="https://github.com/rafaelmartinelli/FacilityLocationProblems.jl/blob/{commit}{path}#{line}",
    sitename="FacilityLocationProblems.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://rafaelmartinelli.github.io/FacilityLocationProblems.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/rafaelmartinelli/FacilityLocationProblems.jl.git",
    target="build",
    branch="gh-pages",
    versions=["stable"=>"v^","v#.#"],
)
