#include <pet/pet.h>

#include <nanobind/nanobind.h>
#include <nanobind/stl/string.h>

namespace nb = nanobind;

NB_MODULE(pypet, m)
{
    nb::class_<::Pet> Pet(m, "Pet");

    Pet.def("talk", &::Pet::talk);
}
