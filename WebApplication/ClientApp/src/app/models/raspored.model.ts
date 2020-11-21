import { LabVezbaSpecificna } from './lab-vezba-specificna.model';
import { Student } from './student.model';

export interface Raspored {
  student: Student;
  labVezbaSpecificna: LabVezbaSpecificna;
  pocetakLaba: string;
  zavrsetakLaba: string;
  ucionica: string;
  izmenjen: boolean;
  id: number;
  nazivLabVezbe?: string;
  stat: string;
}
