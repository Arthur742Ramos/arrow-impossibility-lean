import Mathlib.Data.Finset.Basic
import Mathlib.Data.Fintype.EquivFin

namespace Arrow

section

variable {V A : Type*} [Fintype V] [Fintype A] [DecidableEq V] [DecidableEq A] [Nonempty V]

def Ballot (A : Type*) : Type _ := { f : A -> ℕ // Function.Injective f }

def ranksAbove (s : Ballot A) (x y : A) : Prop := s.val x < s.val y

def Profile (V A : Type*) : Type _ := V -> Ballot A

def SWF (V A : Type*) : Type _ := Profile V A -> Ballot A

def Unanimous (F : SWF V A) : Prop := ∀ (P : Profile V A) (x y : A), (∀ v, ranksAbove (P v) x y) -> ranksAbove (F P) x y

def IIA (F : SWF V A) : Prop := ∀ (P Q : Profile V A) (x y : A), (∀ v, (ranksAbove (P v) x y ↔ ranksAbove (Q v) x y)) -> (ranksAbove (F P) x y ↔ ranksAbove (F Q) x y)

def WeakDecisive (F : SWF V A) (G : Finset V) (x y : A) : Prop := ∀ P : Profile V A, (∀ v ∈ G, ranksAbove (P v) x y) -> (∀ v ∉ G, ranksAbove (P v) y x) -> ranksAbove (F P) x y

def DecisivePair (F : SWF V A) (G : Finset V) (x y : A) : Prop := ∀ P : Profile V A, (∀ v ∈ G, ranksAbove (P v) x y) -> ranksAbove (F P) x y

def Decisive (F : SWF V A) (G : Finset V) : Prop := ∀ x y : A, x ≠ y -> DecisivePair F G x y

def IsDictator (F : SWF V A) (d : V) : Prop := ∀ (P : Profile V A) (x y : A), (ranksAbove (P d) x y ↔ ranksAbove (F P) x y)

namespace Palomar

theorem decisiveUniv (F : SWF V A) (hU : Unanimous F) (x y : A) : DecisivePair F Finset.univ x y := by sorry

theorem fieldExpansion (F : SWF V A) (hU : Unanimous F) (hIIA : IIA F) (G : Finset V) (x y : A) (hxy : x ≠ y) (hWD : WeakDecisive F G x y) (z : A) (hxz : x ≠ z) (hyz : y ≠ z) : Decisive F G := by sorry

theorem groupContraction (F : SWF V A) (hU : Unanimous F) (hIIA : IIA F) (G : Finset V) (hDec : Decisive F G) (hcard : 2 ≤ G.card) (x y z : A) (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) : ∃ G' : Finset V, G' ⊂ G ∧ G'.Nonempty ∧ Decisive F G' := by sorry

theorem arrowImpossibility (F : SWF V A) (hU : Unanimous F) (hIIA : IIA F) (x y z : A) (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) : ∃ d : V, IsDictator F d := by sorry

end Palomar

end

end Arrow
