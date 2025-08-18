#pragma once

#include <pet/pet.h>

class Dog : public Pet
{

public:

    ~Dog() noexcept override = default;

    std::string talk() const override
    {
        return "Woof!";
    }

};