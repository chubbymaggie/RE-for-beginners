include(`commons.m4')void hack_oop_encapsulation(class box * o)
{
    o->width=1; // _EN(``that code can't be compiled'')_RU(`этот код не может быть скомпилирован'): 
                // "error C2248: 'box::width' : cannot access private member declared in class 'box'"
};
