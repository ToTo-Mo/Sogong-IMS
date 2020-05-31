package Sogong.IMS.model;

import lombok.*;

import java.time.LocalDate;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Example {
    int id;
    String title;
    LocalDate createDate;
}
