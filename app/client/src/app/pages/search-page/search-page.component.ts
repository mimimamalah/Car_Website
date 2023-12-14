import { Component, OnInit } from '@angular/core';
import { Member } from 'src/app/interfaces/member';
import { CommunicationService } from 'src/app/services/communication.service';

@Component({
  selector: 'app-search-page',
  templateUrl: './search-page.component.html',
  styleUrls: ['./search-page.component.css']
})
export class SearchPageComponent  implements OnInit{

  searchQuery: string = "";
  isCoopMember: boolean = false;
  isCarpoolingMember: boolean = false;
  memberResult: Member[] = [];

  constructor(private communicationService: CommunicationService){

  }

  ngOnInit(): void {
      
  }


  search(){
    const queryResult = this.searchQuery;
    this.searchQuery = "";
    this.getMemberInfo(queryResult);
    
  }

  getMemberInfo(memberQuery: string){
    this.communicationService.getMember(memberQuery).subscribe((response) => {
      if (response.length > 0){
        this.memberResult = response;
      }
      else{
        window.alert("Aucun résultat pour " + memberQuery);
      }
    });
  }

}
