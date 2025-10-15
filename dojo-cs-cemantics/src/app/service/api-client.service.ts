import {inject, Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {ResponseWord} from "../model/responseWord.model";
import {GuessWord} from "../model/guessWord.model";

@Injectable({
  providedIn: 'root'
})
export class ApiClientService {
  private httpClient = inject(HttpClient);

  public getPokemonValue(guess: GuessWord): Observable<ResponseWord>{
    const requestBody = {
      word1: "centrale",
      word2: guess.value
    };
    
    return this.httpClient.post<ResponseWord>(`https://tp-devops-4mpxr1erjxcm.macbucheron1.deno.net/similarity`, requestBody);
  }
}
