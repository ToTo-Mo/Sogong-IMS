package Sogong.IMS.model;

import lombok.*;

import java.time.LocalDate;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Example {
    int id;
    String title;
    LocalDate createDate;
}
