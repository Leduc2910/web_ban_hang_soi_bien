package service.IService;

import java.util.List;

public interface IAccountService<E> {
    void edit (int id, E e);
    void delete(int id);
    List<E> findAll();
}
