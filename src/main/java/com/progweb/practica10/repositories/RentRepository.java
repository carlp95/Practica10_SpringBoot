package com.progweb.practica10.repositories;


import com.progweb.practica10.entities.Category;
import com.progweb.practica10.entities.Customer;
import com.progweb.practica10.entities.Rent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;

public interface RentRepository extends JpaRepository<Rent, Long> {

    Rent findRentById(long id);

    List<Rent> findAllByOrderById();

    @Query(
            value = "select c.NAME, avg(datediff('day', R.RENT_DATE, R.UNTIL_DATE)) AVERAGE\n" +
                    "from RENT_DEVICES rd, RENT r, DEVICE d, CATEGORY c\n" +
                    "where rd.RENT_ID = r.id and rd.DEVICES_ID = d.id and d.CATEGORY_ID = c.ID\n" +
                    "group by c.NAME",
            nativeQuery = true
    )
    List<Object[]> findAverageDaysRentedByCategory();

    List<Rent> findAllByCustomer(Customer customer);
}
