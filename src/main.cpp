#include <pybind11/pybind11.h>

namespace py = pybind11;

int add(int i, int j) {
    return i + j;
}

PYBIND11_MODULE(cmake_example, m) {
    m.doc() = "";
    m.def("add", &add);
}