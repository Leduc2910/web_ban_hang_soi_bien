package service.IService;
import java.util.List;

public interface IProductService<E> {
    void add(E e);
    void edit (int id, E e);
    void delete(int id);
    List<E> findAll();
}
