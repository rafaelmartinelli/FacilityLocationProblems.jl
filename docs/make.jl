using CFLPLib
using Documenter

DocMeta.setdocmeta!(CFLPLib, :DocTestSetup, :(using CFLPLib); recursive=true)

makedocs(;
    modules=[CFLPLib],
    authors="Rafael Martinelli",
    repo="https://github.com/rafaelmartinelli/CFLPLib.jl/blob/{commit}{path}#{line}",
    sitename="CFLPLib.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://rafaelmartinelli.github.io/CFLPLib.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/rafaelmartinelli/CFLPLib.jl",
)
