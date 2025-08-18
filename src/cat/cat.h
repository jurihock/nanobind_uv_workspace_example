#pragma once

#include <pet/pet.h>

class Cat : public Pet
{

public:

    ~Cat() noexcept override = default;

    std::string talk() const override
    {
        return "Meow!";
    }

};