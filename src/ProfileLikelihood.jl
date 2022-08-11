module ProfileLikelihood
using Reexport

@reexport using DifferentialEquations
@reexport using Random
@reexport using Distributions
@reexport using Optimization
@reexport using OptimizationBBO
@reexport using OptimizationEvolutionary
@reexport using OptimizationGCMAES
@reexport using OptimizationMOI
@reexport using OptimizationMetaheuristics
@reexport using OptimizationMultistartOptimization
@reexport using OptimizationNLopt
@reexport using OptimizationNOMAD
@reexport using OptimizationOptimisers
@reexport using OptimizationOptimJL
@reexport using OptimizationSpeedMapping

export generate_data, relative_error, poisson_error, const_variance_error, likelihood_const, likelihood, find_threshold, estimate_params, find_profile_likelihood

include("generating_data.jl")
include("error_functions.jl")
include("likelihood_function.jl")
include("estimating_parameters.jl")
include("threshold.jl")
include("finding_PL.jl")

end
