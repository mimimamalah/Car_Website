import { Component, Input } from '@angular/core';
import { Member } from 'src/app/interfaces/member';

@Component({
  selector: 'app-membership',
  templateUrl: './membership.component.html',
  styleUrls: ['./membership.component.css']
})
export class MembershipComponent {
  @Input() member: Member;


}
