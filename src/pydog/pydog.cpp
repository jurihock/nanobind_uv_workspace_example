#include <dog/dog.h>

#include <nanobind/nanobind.h>
#include <nanobind/stl/string.h>

namespace nb = nanobind;

NB_MODULE(pydog, m)
{
    nb::module_::import_("pypet");

    nb::class_<::Dog, ::Pet> Dog(m, "Dog");

    Dog.def(nb::init<>());
}
