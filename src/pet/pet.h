#pragma once

#include <string>

class Pet
{

public:

    virtual ~Pet() noexcept = default;

    virtual std::string talk() const = 0;

};