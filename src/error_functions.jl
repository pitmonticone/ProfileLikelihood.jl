function relative_error(data::Vector{T}, sol::Vector{T}, noise_level::T) where T<:Real
    return (1 / noise_level^2) * sum(((abs.(sol) - data) ./ abs.(sol)) .^ 2) + 2.0 * sum(log.(abs.(sol)))
end

function poisson_error(data::Vector{T}, sol::Vector{T}) where T<:Real
    return 2*(sum(abs.(sol)) - sum(data .* log.(abs.(sol))))
end

function const_variance_error(data::Vector{T}, sol::Vector{T}, sigma::T) where T<:Real
    return (1 / sigma^2) * sum((sol - data) .^ 2)
end

function likelihood_const(obj::String; noise_level=0.01, times=Vector{Real}(), data=Vector{Real}(), sigma = 1.0)
    if obj == "relativeError"
        return length(times) * log(noise_level^2) + length(times) * log(2 * pi)
    elseif obj == "poissonError"
        return 2*sum(log.(factorial.(big.(data))))
    elseif obj == "constVarianceError"
        return length(times) * log(2 * pi) + length(times) * log(sigma^2)
    else
        return 0.0
    end
end