import Foundation
import Testing
@testable import PhotoCalendar

@Suite("Array Extension Tests") struct ArrayExtensionTests {
    @Test func chuck34Test() {
        let array = Array(repeating: 1, count: 31)
        
        let result = array.chunked(into: 7)
        
        #expect(result.count == 5)
    }
    
    @Test func chuck31Test() {
        let array = Array(repeating: 1, count: 30)
        
        let result = array.chunked(into: 7)
        
        #expect(result.count == 5)
    }
    
    @Test func chuck28Test() {
        let array = Array(repeating: 1, count: 28)
        
        let result = array.chunked(into: 7)
        
        #expect(result.count == 4)
    }
    
    @Test func chuck29Test() {
        let array = Array(repeating: 1, count: 29)
        
        let result = array.chunked(into: 7)
        
        #expect(result.count == 5)
    }

    @Test func chuck35Test() {
        let array = Array(repeating: 1, count: 35)
        
        let result = array.chunked(into: 7)
        
        #expect(result.count == 5)
    }
}
