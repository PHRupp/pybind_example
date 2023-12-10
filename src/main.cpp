#include <pybind11/pybind11.h>

namespace py = pybind11;

class Data {
public:
	Data(double a){this->b=a;}
	double b;
};

class Msg {
public:
	Msg(int f){this->d = Data(f*3.0);}
	Data d = Data(0);
};

Msg add(int i, int j) {
    return Msg( (double)i+j );
}

PYBIND11_MODULE(cwrap, m) {
    m.doc() = "";
    m.def("add", &add);
	py::class_<Msg>(m, "Msg")
		.def(py::init<int>(), "Msg", py::arg("f"))
		.def_readwrite("d", &Msg::d)
	;
	py::class_<Data>(m, "Data")
		.def_readwrite("b", &Data::b)
	;
}