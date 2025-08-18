#include <cat/cat.h>

#include <nanobind/nanobind.h>
#include <nanobind/stl/string.h>

namespace nb = nanobind;

NB_MODULE(pycat, m)
{
    nb::module_::import_("pypet");

    nb::class_<::Cat, ::Pet> Cat(m, "Cat");

    Cat.def(nb::init<>());
}
